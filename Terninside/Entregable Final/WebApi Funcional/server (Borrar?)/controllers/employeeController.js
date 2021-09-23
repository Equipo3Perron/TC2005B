module.exports = class EmployeeController {
    /**
     * 
     * @param {id: int, filters: [{string: any}]} params 
     */
    constructor(employeeModel) {
        this.employeeModel = employeeModel
    }
    async getEmployee(params) {
        let employee = await this.employeeModel.get(params)
        return employee

        //Con promesas

        // return this.employeeModel.get(params).then((employee) => {
        //     // hacerlo que quieras con employee
        //     return employee
        // })
    }
}