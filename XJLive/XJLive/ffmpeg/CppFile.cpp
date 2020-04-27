//
//  CppFile.cpp
//  XJLive
//
//  Created by 万旭杰 on 2020/4/28.
//  Copyright © 2020 万旭杰. All rights reserved.
//

#include "CppFile.hpp"

CppFile::CppFile(const std::string name)
{
    printf("%s.\n", name.c_str());
}

CppFile::~CppFile()
{
    
}

void CppFile::DoSomething(const std::string& str)
{
    printf("%s.\n", str.c_str());
}
