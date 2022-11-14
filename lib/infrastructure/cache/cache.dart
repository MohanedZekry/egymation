class CacheClient {
  CacheClient() : _cache = <String, Object>{};

  final Map<String, Object> _cache;

  void write<T extends Object>({required String key, required T value}) {
    _cache[key] = value;
  }

  void remove<T extends Object>({required String key}) {
    _cache.remove(key);
  }

  T? read<T extends Object>({required String key}) {
    final value = _cache[key];
    if (value is T) return value;
    return null;
  }

}