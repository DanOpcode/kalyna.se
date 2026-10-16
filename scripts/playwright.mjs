import { execFileSync, spawn } from 'node:child_process';
import { createRequire } from 'node:module';
import { dirname, delimiter, join } from 'node:path';

// Resolve the VM's current mise installation on every run, including after updates.
let playwrightPackage;
try {
  const installation = execFileSync('mise', ['where', 'npm:@playwright/cli'], {
    encoding: 'utf8',
    stdio: ['ignore', 'pipe', 'pipe'],
  }).trim();
  const requireInstallation = createRequire(join(installation, 'package.json'));
  const requireCLI = createRequire(requireInstallation.resolve('@playwright/cli/package.json'));
  playwrightPackage = requireCLI.resolve('playwright/package.json');
} catch (error) {
  console.error('Unable to find the VM-managed Playwright installation. Run tests inside dev-machine with mise and @playwright/cli installed.');
  console.error(error.message);
  process.exit(1);
}

// A previous checkout may still have the old project dependency installed.
// Node would prefer it over NODE_PATH and load two incompatible test runners.
const requireProject = createRequire(new URL('../package.json', import.meta.url));
let localTestRunner;
try {
  localTestRunner = requireProject.resolve('playwright/test');
} catch (error) {
  if (error.code !== 'MODULE_NOT_FOUND') throw error;
}
const requirePlaywright = createRequire(playwrightPackage);
if (localTestRunner && localTestRunner !== requirePlaywright.resolve('playwright/test')) {
  console.error('Remove the old project node_modules directory before running tests; the VM now supplies Playwright.');
  process.exit(1);
}
console.log('Using VM Playwright ' + requirePlaywright('./package.json').version);

// Playwright transpiles the TypeScript config and tests to CommonJS. Let their
// playwright/test imports resolve to the same package as the runner and workers.
const child = spawn(process.execPath, [
  join(dirname(playwrightPackage), 'cli.js'),
  'test',
  ...process.argv.slice(2),
], {
  stdio: 'inherit',
  env: {
    ...process.env,
    NODE_PATH: [dirname(dirname(playwrightPackage)), process.env.NODE_PATH]
      .filter(Boolean).join(delimiter),
  },
});
for (const signal of ['SIGINT', 'SIGTERM']) {
  process.on(signal, () => child.kill(signal));
}
child.on('error', error => {
  console.error(error.message);
  process.exitCode = 1;
});
child.on('exit', (code, signal) => {
  if (signal) {
    process.removeAllListeners(signal);
    process.kill(process.pid, signal);
  }
  else process.exitCode = code;
});
