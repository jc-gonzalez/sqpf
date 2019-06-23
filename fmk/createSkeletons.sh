#!/bin/bash

APP=QPF
DOMAIN=qpf.fmk
COPY="2019 Euclid SOC Team / J C Gonzalez"

cls="Master"
mod="master"
mths="void#run()"
mths="$mths%void#startSession()"
mths="$mths|void#loadStateVector()"
mths="$mths|void#lookForSuspendedTasks()"
mths="$mths|void#appendProdsToQueue(std::vector<std::string> & prods)"
mths="$mths|void#setDirectoryWatchers()"
mths="$mths|void#getHostInfo()"
mths="$mths|ProductMeta &&#checkIfProduct(std::string & fileName)"
mths="$mths|std::vector<std::string> &&#dispatch(std::vector<std::string> & prods)"
mths="$mths|void#scheduleProductsForProcessing(std::vector<std::string> & prods)"
mths="$mths|void#archiveOutputs(std::vector<std::string> & prods)"
mths="$mths|void#transferOutputsToCommander()"
mths="$mths|void#transferRemoteLocalArchiveToCommander(std::vector<std::string> & prods)"
mths="$mths|void#gatherNodesInfo()"
mths="$mths|void#runMainLoop()"
mths="$mths|void#terminate()"
~/bin/cpp/createC++Module.sh "$mod" "$cls" "$APP" "$DOMAIN" "$COPY" "$mths"

cls="DataManager"
mod="datamng"
mths="%void#noop()"
mths="$mths|#${cls}(cfg)"
mths="$mths|void#connect()"
mths="$mths|void#storeProductInfo(m)"
mths="$mths|void#storeTaskInfo(taskId,taskStatus,taskInfo,initial)"
mths="$mths|void#storeProductQueue(queue)"
mths="$mths|void#storeHostsSpectra(info)"
~/bin/cpp/createC++Module.sh "$mod" "$cls" "$APP" "$DOMAIN" "$COPY" "$mths"

cls="FiFo"
mod="fifo"
mths="%void#noop()"
mths="$mths|#${cls}(sz)"
mths="$mths|void#put(o)"
mths="$mths|void#append(o)"
mths="$mths|void#find(o)"
~/bin/cpp/createC++Module.sh "$mod" "$cls" "$APP" "$DOMAIN" "$COPY" "$mths"

cls="MasterServer"
mod="masterserver"
mths="%void#noop()"
mths="$mths|void#popup()"
mths="$mths|void#set_master_handler()"
~/bin/cpp/createC++Module.sh "$mod" "$cls" "$APP" "$DOMAIN" "$COPY" "$mths"
cls="MasterRequester"
mod="masterrequester"
mths="%void#noop()"
~/bin/cpp/createC++Module.sh "$mod" "$cls" "$APP" "$DOMAIN" "$COPY" "$mths"

cls="TaskAgent"
mod="taskagent"
mths="%void#noop()"
mths="$mths|#${cls}(wa,ident,iq,oq,tq,isCommander)"
mths="$mths|void#substitute(rule)"
mths="$mths|void#get_substitution_rules()"
mths="$mths|void#is_substitution_rules()"
mths="$mths|void#stateToTaskStatus(inspCode)"
mths="$mths|void#isEnded()"
mths="$mths|void#do_rules(item)"
mths="$mths|void#sendSpectrumToMng()"
mths="$mths|void#prepareNewTask(taskId,taskFld,proc)"
mths="$mths|void#launchContainer()"
mths="$mths|void#launchNewTask()"
mths="$mths|void#scheduleContainerForRemoval(cnt)"
mths="$mths|void#removeOldContainers()"
mths="$mths|void#atom_move(src,dst)"
mths="$mths|void#prepareOutputs()"
mths="$mths|void#monitorTasks()"
mths="$mths|void#run()"
~/bin/cpp/createC++Module.sh "$mod" "$cls" "$APP" "$DOMAIN" "$COPY" "$mths"

mths="$mths|void#create_agent(lst,wa,iq,oq,tq,isComm)"
cls="TaskManager"
mod="taskmng"
mths="%void#noop()"
mths="$mths|#${cls}(cfg,id,wa,net)"
mths="$mths|void#setDirectoryWatchers()"
mths="$mths|void#createAgents()"
mths="$mths|void#createTaskId(tskAgId,n)"
mths="$mths|void#createTaskFolders(tskWkDir)"
mths="$mths|void#createTask(prod,tskAgId,n,processor)"
mths="$mths|void#selectAgent()"
mths="$mths|void#updateAgent(taskId,agNum,agName,agNumTsk)"
mths="$mths|void#updateContainer(agName,contId,contStatus)"
mths="$mths|void#updateTasksInfo(datmng)"
mths="$mths|void#schedule(prod,processor)"
mths="$mths|void#retrieveOutputs()"
mths="$mths|void#retrieveAgentsInfo()"
mths="$mths|void#showSpectra()"
mths="$mths|void#terminate()"
~/bin/cpp/createC++Module.sh "$mod" "$cls" "$APP" "$DOMAIN" "$COPY" "$mths"

cls="TaskOrchestrator"
mod="taskorc"
mths="%void#noop()"
mths="$mths|#${cls}(cfg)"
mths="$mths|void#checkRules(prod)"
mths="$mths|void#schedule(prod,manager)"
~/bin/cpp/createC++Module.sh "$mod" "$cls" "$APP" "$DOMAIN" "$COPY" "$mths"

cls="HttpCommServer"
mod="httpcommsrv"
mths="%void#noop()"
mths="$mths|#${cls}(addr,port,base_path)"
~/bin/cpp/createC++Module.sh "$mod" "$cls" "$APP" "$DOMAIN" "$COPY" "$mths"
cls="HttpCommRequester"
mod="httpcommrqst"
mths="%void#noop()"
mths="$mths|#${cls}()"
mths="$mths|void#set_server_url(server_url)"
mths="$mths|void#request_info(route)"
mths="$mths|void#request_data(route)"
mths="$mths|void#request_data_and_save_to_file(route,file)"
mths="$mths|void#post_file(file,route)"
~/bin/cpp/createC++Module.sh "$mod" "$cls" "$APP" "$DOMAIN" "$COPY" "$mths"


~/bin/cpp/createC++Module.sh "balmode" "BalancingMode" "$APP" "$DOMAIN" "$COPY" "%"
~/bin/cpp/createC++Module.sh "wa" "WorkArea" "$APP" "$DOMAIN" "$COPY" "%"
~/bin/cpp/createC++Module.sh "procnet" "ProcessingNetwork" "$APP" "$DOMAIN" "$COPY" "%"

