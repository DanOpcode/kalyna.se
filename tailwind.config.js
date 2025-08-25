/** @type {import('tailwindcss').Config} */
export default {
  darkMode: 'class', // Enable class-based dark mode
  content: [
    './lib/**/*.{ex,heex}',
    './lib/**/*.ex',
    './_site/**/*.html'
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}