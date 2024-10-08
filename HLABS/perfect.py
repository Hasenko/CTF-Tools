# A perfect number is a number that, when added to its divisors excluding itself, results in itself.
# Say the number that represents you.
# For example, 6 (1 + 2 + 3), 28 (1 + 2 + 4 + 7 + 14) are perfect numbers.
# Your colleague worked hard last night to create a program to determine perfect numbers.
# 6 is not a perfect number, so I expected it to return False, but unfortunately it returned True.
# Let's find the error in the is_perfect_number function below and help our poor colleague!

def is_perfect_number(num):
    Sum = 0
    for i in range(1, num):
        if(num % i == 0):
            Sum = Sum + i
    if (Sum == num):
        return True
    else:
        return False

if __name__ == "__main__":
    assert is_perfect_number(6) is True, 'test not passed. please check your fix again'
    assert is_perfect_number(24) is False, 'test not passed. please check your fix again'
    assert is_perfect_number(92) is False, 'test not passed. please check your fix again'
    assert is_perfect_number(28) is True, 'test not passed. please check your fix again'
    assert is_perfect_number(76) is False, 'test not passed. please check your fix again'
    
    print('All test passed! probably your fix works well. Lets try next code for FLAG!')
    dict_flag = {71: [80, 89],42: [79, 85],56: [71, 78],25: [87, 79],28: [108, 98],50: [78, 68],17: [65, 74],34: [68, 79],93: [68, 72],81: [33, 82],23: [87, 68],24: [77, 77],566: [80, 67],413: [95, 67],35: [67, 70],1: [81, 81],43: [65, 71],100: [67, 85],64: [75, 78],3410: [82, 87],33550336: [95, 52],45: [89, 77],369078: [66, 71],3212: [65, 90],8128: [48, 117],236040: [77, 82],70: [71, 85],129: [108, 98],94: [66, 86],91: [79, 69],688433: [77, 82],40: [85, 66],655: [48, 117],84: [89, 87],96: [87, 88],59: [85, 89],47: [95, 52],247867: [68, 71],27: [73, 80],601064: [81, 73],685:[33,45],38: [68, 77],28776783: [51, 114],31: [79, 85],5: [80, 66],63: [88, 79],15: [80, 85],1212: [114, 51],725654: [83, 81],66: [71, 66],99617: [66, 73],6: [104, 101],150: [104, 101],14: [78, 78],7: [90, 78],608827: [73, 71],72: [89, 76],44: [116, 66],2: [78, 84],10: [83, 85],67: [81, 73],51: [65, 75],74: [90, 65],58: [82, 73],49: [68, 75],2118: [69, 69],11: [68, 85],76: [73, 67],62: [88, 69],684: [51, 33],80: [89, 90],8: [84, 87],75: [70, 66],89: [69, 70],18: [65, 90],92: [74, 79],496: [123, 89],55: [80, 88],22: [82, 66],57: [86, 87],83: [85, 82],19: [67, 78],513731: [70, 75],36: [88, 82],125:[125,124],567: [123, 89],39: [75, 89],77: [75, 72],5050: [114, 33],61: [77, 77],69: [79, 88],88: [87, 75],20: [69, 72],73: [69, 66],30: [70, 85],53: [83, 85],842060: [82, 90]}
    print('%s' % ''.join(map(lambda n: chr(dict_flag[n][is_perfect_number(n)]), [150,6,129,28,567,496,655,8128,47,33550336,1212, 28776783,413,566,684,5050, 30, 684, 19, 44, 685, 81, 125])))
