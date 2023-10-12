abstract class AuthState{}

class AuthInitialState extends AuthState{}

class AuthLoadingState extends AuthState{}

class AuthSentState extends AuthState{}

class AuthCodeVerifiedState extends AuthState{}

class AuthLogInState extends AuthState{}

class AuthLogOutState extends AuthState{}

class AuthErrorState extends AuthState{}