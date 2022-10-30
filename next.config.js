/** @type {import('next').NextConfig} */
const withExportImages = require('next-export-optimize-images')
const withPurgeCss = require('next-purgecss');

const nextConfig = withPurgeCss(withExportImages({
  reactStrictMode: true,
  swcMinify: true,
}))

module.exports = nextConfig
