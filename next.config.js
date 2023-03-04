/** @type {import('next').NextConfig} */
const withExportImages = require('next-export-optimize-images')
const withPurgeCss = require('next-purgecss');

const nextConfig = withPurgeCss(withExportImages({
  reactStrictMode: true,
  swcMinify: true,
  // https://stackoverflow.com/a/71313863/595990
  webpack(config) {
    config.module.rules.push({
      test: /\.svg$/i,
      issuer: /\.[jt]sx?$/,
      use: [{
        loader: '@svgr/webpack',
        options: {
          prettier: false,
          svgo: true,
          svgoConfig: {
            plugins: [
              {
                name: 'preset-default',
                params: {
                  overrides: { removeViewBox: false },
                },
              },
            ],
          },
          titleProp: true,
        },
      }],
    });
    return config;
  },
}))

module.exports = nextConfig
