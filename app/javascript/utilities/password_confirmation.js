document.addEventListener('turbolinks:load', function() {
// Get form block whit password
form = document.querySelector('.validate')
  if (form) {
    let passwordField = this.querySelector('.password-field')
    let confirmationField = this.querySelector('.confirmation-field')

    confirmationField.oninput = function() {

      if (passwordField.value != confirmationField.value) {
        document.getElementById('message').classList.remove('hide')
        document.getElementById('message').classList.add('mismatch')
        document.getElementById('message').innerHTML = 'not matching'
      } else {
        document.getElementById('message').classList.remove('hide')
        document.getElementById('message').classList.remove('mismatch')
        document.getElementById('message').classList.add('match')
        document.getElementById('message').innerHTML = 'matching'
      }

      
      if (confirmationField.value === '') {
        document.getElementById('message').classList.add('hide')
      }
    }
  }
})


