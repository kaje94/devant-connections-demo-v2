import demo_integration_5.getusers;

final getusers:Client get_users = check new (apiKeyConfig = { choreoAPIKey: ChoreoAPIKey }, config = { proxy: devantProxyConfig, timeout: 60 }, serviceUrl = ServiceURL);
