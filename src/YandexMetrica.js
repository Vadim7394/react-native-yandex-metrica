import { YandexMetricaBridge as YandexMetricaBridgeNative } from './NativeModule';
console.log(YandexMetricaBridgeNative);

export class YandexMetrica {
  static activateWithApiKey(apiKey) {
    YandexMetricaBridgeNative.activateWithApiKey(apiKey);
  }

  /**
   * Sends a custom event message and additional parameters (optional).
   * @param {string} message
   * @param {object} [params=null]
   */
  static reportEvent(message: string, params: ?Object = null) {
    YandexMetricaBridgeNative.reportEvent(message, params);
  }

  /**
   * Sends a report deep link (optional).
   * @param {string} link
   */
  static reportDeepLink(link: string) {
    if (link) YandexMetricaBridgeNative.reportDeepLink(link);
    else console.log('Link empty');
  }

  /**
   * Sends a report referral url (optional).
   * @param {string} link
   */
  static reportReferralUrl(link: string) {
    if (link) YandexMetricaBridgeNative.reportReferralUrl(link);
    else console.log('Link empty');
  }

  /**
   * Sends error with reason.
   * @param {string} error
   * @param {object} reason
   */
  static reportError(error: string, reason: Object) {
    YandexMetricaBridgeNative.reportError(error, reason);
  }

  static setDryRun(enabled) {
    YandexMetricaBridgeNative.setDryRun(enabled);
  }

  static isInitialized() {
    return YandexMetricaBridgeNative.isInitialized();
  }
}
