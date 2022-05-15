import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

const listenInactiveHeartEvent = (articleId) => {
  $('.inactive-heart').on('click', () => {
    axios.post(`/articles/${articleId}/like`)
      .then((response) => {
        if (response.data.status = 'OK') {
          $('.active-heart').removeClass('hidden')
          $('.inactive-heart').addClass('hidden')
        }
      })
      .catch((e) => {
        window.alert('Error')
        console.log(e)
      })
  })
}

const listenActiveHeartEvent = (articleId) => {
  $('.active-heart').on('click', () => {
    axios.delete(`/articles/${articleId}/like`)
      .then((response) => {
        if (response.data.status = 'OK') {
          $('.active-heart').addClass('hidden')
          $('.inactive-heart').removeClass('hidden')
        }
      })
      .catch((e) => {
        window.alert('Error')
        console.log(e)
      })
  })
}

export {
  listenInactiveHeartEvent,
  listenActiveHeartEvent
}
