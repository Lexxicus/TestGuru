document.addEventListener('turbolinks:load', function () {
  let controls =  $('.form-inline-link').on('click', formInlineLinkHandler)
  
  let errors = document.querySelector('.resource-errors')
    
  if (controls.length && errors) {
    let resourceId = errors.dataset.resourceId
    formInlineHandler(resourceId)
  }
})
  
function formInlineLinkHandler(event) {
  event.preventDefault()
  let testId = this.dataset.testId
  formInlineHandler(testId)
}

function formInlineHandler(testId) {
  let link = document.querySelector(`.form-inline-link[data-test-id="${testId}"]`)
  let $testTitle = $(`.test-title[data-test-id="${testId}"]`)
  let $formInLine = $(`.form-inline[data-test-id="${testId}"]`)

  $testTitle.toggle()
  $formInLine.toggle()

  if ($formInLine.is(':visible')) {
    link.textContent = 'Отмена'
  } else {
    link.textContent = 'Редактировать'
  }
}
