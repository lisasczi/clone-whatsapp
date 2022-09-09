import axios from 'axios'

const services = {
  allContacts (user) {
    console.log(localStorage.token)
    return axios
      .get(`http://localhost:3000/api/v1/users/${user.id}/messages`, {
      })
  }
}
export default services
