import ballerina/http;

listener http:Listener httpDefaultListener = http:getDefaultListener();

service / on httpDefaultListener {
    
    resource function get enrich(string[] emails) returns EnrichedUsersResponse|error {
        EnrichedUser[] enrichedUsers = [];
        
        // If no emails provided, return some default dummy data
        if emails.length() == 0 {
            enrichedUsers.push({
                email: "sample1@example.com",
                name: "John Smith",
                company: "Tech Corp",
                title: "Software Engineer",
                location: "San Francisco, CA"
            });
            enrichedUsers.push({
                email: "sample2@example.com",
                name: "Jane Johnson",
                company: "Innovation Inc",
                title: "Product Manager",
                location: "New York, NY"
            });
            enrichedUsers.push({
                email: "sample3@example.com",
                name: "Michael Williams",
                company: "Digital Solutions",
                title: "Data Scientist",
                location: "Austin, TX"
            });
        } else {
            // Generate dummy enriched data for each email
            foreach string email in emails {
                enrichedUsers.push({
                    email: email,
                    name: generateName(email),
                    company: generateCompany(),
                    title: generateTitle(),
                    location: generateLocation()
                });
            }
        }
        
        return {users: enrichedUsers};
    }

}

// Helper functions to generate dummy data
function generateName(string email) returns string {
    string[] firstNames = ["John", "Jane", "Michael", "Sarah", "David", "Emily"];
    string[] lastNames = ["Smith", "Johnson", "Williams", "Brown", "Jones", "Garcia"];
    int index = email.length() % firstNames.length();
    return firstNames[index] + " " + lastNames[index];
}

function generateCompany() returns string {
    string[] companies = ["Tech Corp", "Innovation Inc", "Digital Solutions", "Cloud Systems", "Data Analytics Co"];
    return companies[0];
}

function generateTitle() returns string {
    string[] titles = ["Software Engineer", "Product Manager", "Data Scientist", "DevOps Engineer", "Solutions Architect"];
    return titles[0];
}

function generateLocation() returns string {
    string[] locations = ["San Francisco, CA", "New York, NY", "Austin, TX", "Seattle, WA", "Boston, MA"];
    return locations[0];
}
