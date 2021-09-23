const AbstractModel = require('./AbstractModel.js')

module.exports = class EmployeeModel extends AbstractModel {
    async get({ id, filters }) {
        throw new Error('implement me pls')
    }
    async create(data) {
        throw new Error('implement me pls')
    }
    async update(data) {
        throw new Error('implement me pls')
    }
    async delete(id) {
        throw new Error('implement me pls')
    }
}