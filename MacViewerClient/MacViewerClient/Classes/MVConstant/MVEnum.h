//
//  MVEnum.h
//  MacViewerClient
//


#ifndef MacViewerClient_MVEnum_h
#define MacViewerClient_MVEnum_h

enum MVNetworkServiceResult
{
    E_NETWORK_INVALID_PORT,
    E_NETWORK_INVALID_IP,
    E_NETWORK_CONNECTING,
};

typedef enum MVNetworkServiceResult ENetworkServiceResult;

enum MVNetworkConnectionOption
{
    E_NETWORK_CONNECTION_INPUT,
    E_NETWORK_CONNECTION_OUTPUT,
    E_NETWORK_CONNECTION_BOTH,
};

typedef enum MVNetworkConnectionOption ENetworkConnectionOption;

#endif
