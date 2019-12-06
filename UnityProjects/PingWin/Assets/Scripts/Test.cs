﻿using UnityEngine;
using System.Collections;
using System.Runtime.InteropServices;
using System.IO;
using System.Reflection;
using System;

public class Test : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        
        Debug.Log("call c# wrapper dll");
		
		string assemblyFolder = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location);

        Debug.Log(System.Environment.GetEnvironmentVariable("DYLD_LIBRARY_PATH"));
        Debug.Log(System.Environment.GetEnvironmentVariable("DYLD_FRAMEWORK_PATH"));
        Debug.Log(System.Environment.GetEnvironmentVariable("DYLD_FALLBACK_FRAMEWORK_PATH"));
        
		//PingPluginManaged.Main(new string[]{"www.xfinity.com"});
		var res = Ping.Execute("www.xfinity.com");
		Debug.Log($"Script output - time={res.Time}, isDone={res.IsDone}, Address={res.IP}");
		Debug.Log("call over");
		//https://stackoverflow.com/questions/13103083/how-do-i-push-to-github-under-a-different-username
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}