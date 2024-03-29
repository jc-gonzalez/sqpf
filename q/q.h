/******************************************************************************
 * File:    q.h
 *          This file is part of QPF
 *
 * Domain:  qpf.fmk.Queue
 *
 * Last update:  1.0
 *
 * Date:    20190614
 *
 * Author:  J C Gonzalez
 *
 * Copyright (C) 2019 Euclid SOC Team / J C Gonzalez
 *_____________________________________________________________________________
 *
 * Topic: General Information
 *
 * Purpose:
 *   Declare Queue class
 *
 * Created by:
 *   J C Gonzalez
 *
 * Status:
 *   Prototype
 *
 * Dependencies:
 *   TBD
 *
 * Files read / modified:
 *   none
 *
 * History:
 *   See <Changelog> file
 *
 * About: License Conditions
 *   See <License> file
 *
 ******************************************************************************/

#ifndef QUEUE_H
#define QUEUE_H

//============================================================
// Group: External Dependencies
//============================================================

//------------------------------------------------------------
// Topic: System headers
//   - iostream
//------------------------------------------------------------
#include <iostream>
#include <queue>
#include <thread>
#include <mutex>
#include <condition_variable>

using std::queue;

//------------------------------------------------------------
// Topic: External packages
//------------------------------------------------------------

//------------------------------------------------------------
// Topic: Project headers
//------------------------------------------------------------

//==========================================================================
// Class: Queue
//==========================================================================
template<typename T>
class Queue {

public:
    //----------------------------------------------------------------------
    // Constructor
    //----------------------------------------------------------------------
    Queue();

    //----------------------------------------------------------------------
    // Destructor
    //----------------------------------------------------------------------
    virtual ~Queue();

public:
    //----------------------------------------------------------------------
    // Method: append
    //----------------------------------------------------------------------
    void append(Queue<T> & other);
    
    //----------------------------------------------------------------------
    // Method: push
    //----------------------------------------------------------------------
    void push(T && obj);

    //----------------------------------------------------------------------
    // Method: get
    //----------------------------------------------------------------------
    bool get(T & obj, int msTimeout = 100);

    //----------------------------------------------------------------------
    // Method: empty
    //----------------------------------------------------------------------
    bool empty();

    //----------------------------------------------------------------------
    // Method: dump
    //----------------------------------------------------------------------
    void dump();

private:
    std::queue<T> objects;
    std::mutex    queueMutex;
    std::condition_variable cv;

};

#endif // QUEUE_H
