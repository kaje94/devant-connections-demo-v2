public type UsersResponse record {
    string[] users;
};

public type EmailsRequest record {
    string[] emails;
};

public type EnrichedUser record {
    string email;
    string name;
    string company;
    string title;
    string location;
};

public type EnrichedUsersResponse record {
    EnrichedUser[] users;
};
