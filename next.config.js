/** @type {import('next').NextConfig} */
const path = require('path')
const withExportImages = require('next-export-optimize-images')

const nextConfig = withExportImages({
  reactStrictMode: true,
  swcMinify: true,
})

module.exports = nextConfig
