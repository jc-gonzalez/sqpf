/******************************************************************************
 * File:    main.cpp
 *          This file is part of QLA Processing Framework
 *
 * Domain:  QPF.QPF.main
 *
 * Version:  2.0
 *
 * Date:    2015/07/01
 *
 * Author:   J C Gonzalez
 *
 * Copyright (C) 2015-2018 Euclid SOC Team @ ESAC
 *_____________________________________________________________________________
 *
 * Topic: General Information
 *
 * Purpose:
 *   Create all components with the Deployer, and launch the Core system
 *
 * Created by:
 *   J C Gonzalez
 *
 * Status:
 *   Prototype
 *
 * Dependencies:
 *   none
 *
 * Files read / modified:
 *   none
 *
 * History:
 *   See <Changelog>
 *
 * About: License Conditions
 *   See <License>
 *
 ******************************************************************************/

#include "deployer.h"

//----------------------------------------------------------------------
// Function: main
// Creates the application main class, and invokes its run method
//----------------------------------------------------------------------
int main(int argc, char *argv[])
{
    string HOME(getenv("HOME"));
    Log::initialize(HOME + "/.qpf/log4cpp.properties");

    Deployer deployer(argc, argv);
    return deployer.run();
}
