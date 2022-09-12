import axios from 'axios'

const services = {
  allContacts (user) {
    const headers = {'Authorization': `Bearer ${localStorage.token}`}
    return axios
      .get(`http://localhost:3000/api/v1/users/${user.id}/messages`, {headers})
  }
}
export default services
