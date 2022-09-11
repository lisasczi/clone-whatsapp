import axios from 'axios'

const services = {
  signin (phoneNumber) {
    return axios
      .post('http://localhost:3000/signin', {
        phone_number: phoneNumber
      })
      .then(response => response)
  }
}

export default services
