import demo_integration_3.getusers;

import ballerina/log;

public function main() returns error? {
    do {
        getusers:UsersResponse usersUsersresponse = check get_users->/users.get();

        log:printInfo("usersUsersresponse = " + usersUsersresponse.toString());
    } on fail error e {
        log:printError("Error occurred", 'error = e);
        return e;
    }
}
