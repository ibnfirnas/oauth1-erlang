-record(oauth1_server_args_initiate,
    { resource            :: oauth1_resource:t()
    , consumer_key        :: oauth1_credentials:id(client)
    , signature           :: binary()
    , signature_method    :: oauth1_signature:method()
    , timestamp           :: oauth1_timestamp:t()
    , nonce               :: oauth1_nonce:t()

    % Client "ready" callback URI that will be called by the resource owner
    % with the temporary token and a verifier, after "authorize" step:
    , client_callback_uri :: oauth1_uri:t()

    , host                :: binary()

    , version      = none :: hope_option:t('1.0')
    }).

-record(oauth1_server_args_token,
    { resource         :: oauth1_resource:t()
    , consumer_key     :: oauth1_credentials:id(client)
    , signature        :: binary()
    , signature_method :: oauth1_signature:method()
    , timestamp        :: oauth1_timestamp:t()
    , nonce            :: oauth1_nonce:t()

    % Temporary token that was returned by "initiate":
    , temp_token       :: oauth1_credentials:id(tmp)

    % Authorization verification token that was returned by "authorize":
    , verifier         :: binary()

    , host             :: binary()

    , version   = none :: hope_option:t('1.0')
    }).

-record(oauth1_server_args_validate_resource_request,
    { resource         :: oauth1_resource:t()
    , consumer_key     :: oauth1_credentials:id(client)
    , signature        :: oauth1_signature:digest()
    , signature_method :: oauth1_signature:method()
    , timestamp        :: oauth1_timestamp:t()
    , nonce            :: oauth1_nonce:t()
    , token            :: oauth1_credentials:id(token)

    , host             :: binary()

    , version   = none :: hope_option:t('1.0')
    }).
