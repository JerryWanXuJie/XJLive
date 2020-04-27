//
//  CppFile.hpp
//  XJLive
//
//  Created by 万旭杰 on 2020/4/28.
//  Copyright © 2020 万旭杰. All rights reserved.
//

#pragma once

#include <string>
//using std::string;

class CppFile {
public:
    CppFile(const std::string name);
    ~CppFile();
public:
    void DoSomething(const std::string& str);
};
