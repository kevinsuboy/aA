import {
    signup,
    login,
    logout
} from '../util/session_api_util';

export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const LOGOUT_CURRENT_USER = "LOGOUT_CURRENT_USER";

const receiveCurrentUser = user => {
    return {
        type: RECEIVE_CURRENT_USER,
        user
    }
};


const logoutCurrentUser = () => {
    return {
        type: LOGOUT_CURRENT_USER,
    };
};

const receiveErrors = errors => {
    return {
        type: 
    };
};

export const signup = (formUser) => {
    return (dispatch) => {
        return postUser(formUser)
        .then((user) => {
            dispatch(receiveCurrentUser(user))
        })
        .catch(
            errors => dispatch(receiveErrors(errors))
        );
    };
};

export const login = (formUser) => {
    return (dispatch) => {
        return postSession(formUser)
        .then((user) => {
            dispatch(receiveCurrentUser(user))
        })
        .catch(
            errors => dispatch(receiveErrors(errors))
        );
    };
};

export const logout = () => {
    return (dispatch) => {
        return deleteSession()
        .then(() => {
            dispatch(logoutCurrentUser())
        })
        .catch(
            errors => dispatch(receiveErrors(errors))
        );
    };
};
