package com.Student.Registration.util;// Import the correct User class instead of UserDao
import com.Student.Registration.model.User;
import java.util.List;

public class SortUtils {
    public static List<User> insertionSort(List<User> list) {
        for (int i = 1; i < list.size(); i++) {
            User key = list.get(i);
            int j = i - 1;

            // Now getTimestamp() should be found if defined in User class
            while (j >= 0 && list.get(j).getTimestamp() > key.getTimestamp()) {
                list.set(j + 1, list.get(j));
                j--;
            }
            list.set(j + 1, key);
        }
        return list;
    }
}