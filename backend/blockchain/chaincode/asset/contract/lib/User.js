'use strict';

class User {

    /**
     *
     * User
     *
     * Constructor for a User object.
     *
     * @param {String} emailAddress - Email address of the user, will also be used as the identifier for the user.
     * @param {String} firstName - First name of the user.
     * @param {String} lastName - Last name of the user.
     * @returns - User object
     */

    constructor(firstName, lastName, emailAddress) {

        this.firstName = firstName;
        this.lastName = lastName;
        this.emailAddress = emailAddress;
        this.type = 'User';
        return this;
    }
}
module.exports = User;