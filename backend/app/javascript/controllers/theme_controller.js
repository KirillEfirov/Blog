import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="theme"
export default class extends Controller {
  connect() {
    const savedTheme = localStorage.getItem('theme')
    if (savedTheme) {
      this.setTheme(savedTheme)
    } else {
      this.setTheme('dark')
    }
  }

  toggle() {
    const currentTheme = document.documentElement.classList.contains('dark') ? 'dark' : 'light'
    const newTheme = currentTheme === 'dark' ? 'light' : 'dark'

    this.setTheme(newTheme)

    localStorage.setItem('theme', newTheme)
  }

  setTheme(theme) {
    if (theme === 'dark') {
      document.documentElement.classList.add('dark')
      document.body.classList.add('dark:bg-black')
    } else {
      document.documentElement.classList.remove('dark')
      document.body.classList.remove('dark:bg-black')
    }
  }
}
