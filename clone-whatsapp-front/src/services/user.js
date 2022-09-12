import axios from 'axios'

const services = {
  signin (phoneNumber) {
    return axios
      .post('http://localhost:3000/signin', {
        phone_number: phoneNumber
      })
      .then(response => response)
  },
  signup (phoneNumber, lastName, name) {
    return axios
      .post('http://localhost:3000/signup', {
        phone_number: phoneNumber,
        last_name: lastName,
        name: name
      })
      .then(response => response)
  }
}

export default services
