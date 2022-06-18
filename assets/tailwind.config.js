/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './js/**/*.js',
    '../lib/defdo/*_web.ex',
    '../lib/defdo/*_web/**/*.*ex'
  ],
  theme: {
    extend: {},
  },
  plugins: [
    require('@tailwindcss/forms')
  ]
}
