class TonConnectError implements Exception {
  final String prefix = '[TON_CONNECT_SDK_ERROR]';
  String? info;
  String? message;

  TonConnectError(this.message);

  @override
  String toString() {
    return '$prefix${info != null ? ': $message' : ''}';
  }
}

class WalletAlreadyConnectedError extends TonConnectError {
  WalletAlreadyConnectedError(super.message);

  @override
  final String? info =
      'Wallet connection called but wallet already connected. To avoid the error, disconnect the wallet before doing a new connection.';
}

class WalletNotConnectedError extends TonConnectError {
  WalletNotConnectedError(super.message);

  @override
  final String? info =
      'Send transaction or other protocol methods called while wallet is not connected.';
}

class WalletNotSupportFeatureError extends TonConnectError {
  WalletNotSupportFeatureError(super.message);

  @override
  final String? info = "Wallet doesn't support requested feature method.";
}

class FetchWalletsError extends TonConnectError {
  FetchWalletsError(super.message);

  @override
  final String? info = 'An error occurred while fetching the wallets list.';
}

class UnknownError extends TonConnectError {
  UnknownError(super.message);

  @override
  final String? info = 'Unknown error.';
}

class BadRequestError extends TonConnectError {
  BadRequestError(super.message);

  @override
  final String? info = 'Request to the wallet contains errors.';
}

class UnknownAppError extends TonConnectError {
  UnknownAppError(super.message);

  @override
  final String? info =
      'App tries to send rpc request to the injected wallet while not connected.';
}

class UserRejectsError extends TonConnectError {
  UserRejectsError(super.message);

  @override
  final String? info = 'User rejects the action in the wallet.';
}

class ManifestNotFoundError extends TonConnectError {
  ManifestNotFoundError(super.message);

  @override
  final String? info =
      'Manifest not found. Make sure you added tonconnect-manifest.json to the root of your app or passed correct manifest_url. See more https://github.com/ton-connect/docs/blob/main/requests-responses.md#app-manifest';
}

class ManifestContentError extends TonConnectError {
  ManifestContentError(super.message);

  @override
  final String? info =
      'Passed tonconnect-manifest.json contains errors. Check format of your manifest. See more https://github.com/ton-connect/docs/blob/main/requests-responses.md#app-manifest';
}
