import demo_automation_2.enrichuserdata;
import demo_automation_2.getusers;
import ballerina/log;

public function main() returns error? {
    do {
        getusers:UsersResponse usersUsersresponse = check get_users->/users.get();
        log:printInfo("Users fetched successfully "+ usersUsersresponse.toString());
        enrichuserdata:EnrichedUsersResponse enrichuserdataEnrichedusersresponse = check enrichUserData->/enrich.get(emails = usersUsersresponse.users);
        log:printInfo("Users enriched successfully "+ enrichuserdataEnrichedusersresponse.toString());
        check emailConnection->sendMessage({
            to: usersUsersresponse.users,
            subject: "devant demo",
            'from: "a.kajendran@gmail.com",
            body: "devant connections demo"
        });
        log:printInfo("Email sent successfully");
    } on fail error e {
        log:printError("Error occurred", 'error = e);
        return e;
    }
}
