package com.jeffroush;

// See https://github.com/turbomanage/basic-http-client

import com.turbomanage.httpclient.BasicHttpClient;
import com.turbomanage.httpclient.ParameterMap;

public class Notifier {
    void notifyActivity() {
        BasicHttpClient client = new BasicHttpClient("http://localhost:3000/heartbeat_mouse");
        ParameterMap params = new ParameterMap();
        client.get("/", params);
    }
}
