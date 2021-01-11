document.addEventListener('turbolinks:load', function () {
  let progressBar = document.querySelector('.progress-bar')

  if (progressBar) {
    let percent = progressBar.dataset.percent
    progressBar.style.width = percent + '%'
  }
})
