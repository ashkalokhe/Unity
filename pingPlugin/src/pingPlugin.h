//
//  pingPlugin.hpp
//  pingAPIapp
//
//  Created by Kalokhe, Ashwini on 12/3/19.
//  Copyright © 2019 Kalokhe, Ashwini. All rights reserved.
//

#ifndef pingPlugin_h
#define pingPlugin_h

#include <stdio.h>

#include <stdbool.h> 

struct PingResult
{
    int time;
    bool isDone;
};

PingResult* Ping(const char address[]);


#endif /* pingPlugin_hpp */
