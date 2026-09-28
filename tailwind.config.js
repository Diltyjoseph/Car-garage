export default {
  content: ['./index.html', './src/**/*.{js,jsx}'],
  theme: {
    extend: {
      colors: {
        navy: { 900: '#0a0f1e', 800: '#0d1528', 700: '#111d3d', 600: '#1a2a52' },
        brand: { DEFAULT: '#3b82f6', dark: '#2563eb', light: '#60a5fa' }
      }
    }
  },
  plugins: []
}
