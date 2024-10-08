reversed_flag = '}This_is_a_reversed_string_Your_task_is_to_flip_it_and_find_the_correct_string_Submit_the_correct_string_as_flag{bleh'

def my_function(x):
    return x[::-1]

flag = my_function(reversed_flag)
print(flag)