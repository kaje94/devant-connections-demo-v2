import demo_integration_3.getusers;

final getusers:Client get_users = check new (apiKeyConfig = { choreoAPIKey: ChoreoAPIKey4 }, config = { proxy: devantProxyConfig, timeout: 60 }, serviceUrl = ServiceURL4);
