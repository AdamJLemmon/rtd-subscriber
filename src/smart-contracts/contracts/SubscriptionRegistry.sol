pragma solidity 0.4.24;

contract SubscriptionRegistry {
    // Some way to store the active subscriptions
    // Currently just single subscription
    mapping(address => bool) public activeSubscriptions_;

    event Subscribe(address indexed subscriber);
    event Cancel(address indexed subscriber);

    /**
        @notice Allow a user to subscribe to the service 
        @dev Transactions must be sent directly by the user wishing to subscribe
        msg.sender is the account that is subscribing.  Enforce value to be sent here?  Define the subscriptin token etc?
     */
    function subscribe() external returns (bool) {
        // TODO value must be sent?  Other requirements to persmission who may subscribe?
        return setSubscription(msg.sender, true);
    }

    /**
        @notice Allow a user to subscribe to the service via a delegated transaction. 
        @dev Ensure transactions are delegated to the service provider
        @param _subscriber  Address of who is subscribing if NOT the sender
        @param _sig   sig of the subscriber if not the sender

        No value required likely, payments will be made off chain for this form of account
     */
    function delegatedSubscribe(address _subscriber, bytes _sig) external returns (bool) {
        // TODO verify the sig
        // TODO other pre con check that are required?
        return setSubscription(_subscriber, true);
    }

    /**
        @notice Allow the subscriber to cancel their subscription at any time
     */
    function cancelSubscription() external returns (bool) {
        return setSubscription(msg.sender, false);
    }

    /**
        @notice Allow the subscriber to cancel their subscription at any time
        @dev Via a delegated transaction, signed by the subscriber, sent by the provider?
     */
    function delegateCancelSubscription(address _subscriber, bytes _sig) external returns (bool) {
        // TODO verify sig
        return setSubscription(_subscriber, false);
    }

    /**
        @dev utility to update subscriptions
     */
    function setSubscription(address _subscriber, bool _state) private returns (bool) {
        activeSubscriptions_[_subscriber] = _state;
        
        // Emite correct event
        if (_state) {
            emit Subscribe(_subscriber);
        } else {
            emit Cancel(_subscriber);
        }
        
        return true;
    }
}