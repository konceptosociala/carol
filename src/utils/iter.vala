using Gee;

namespace Utils {
    
    public T[] collect<T>(Iterator<T> iter) {
        var tmp = new ArrayList<T>();

        while (iter.next()) {
            tmp.add(iter.get());
        }

        return tmp.to_array();
    }
}