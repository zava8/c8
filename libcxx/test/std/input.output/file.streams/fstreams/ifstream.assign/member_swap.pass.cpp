//===----------------------------------------------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

// FILE_DEPENDENCIES: test.dat, test2.dat

// <fstream>

// template <class charT, class traits = char_traits<charT> >
// class basic_ifstream

// void swap(basic_ifstream& rhs);

#include <fstream>
#include <cassert>

#include "test_macros.h"

int main(int, char**)
{
    {
        std::ifstream fs1("test.dat");
        std::ifstream fs2("test2.dat");
        fs1.swap(fs2);
        double x = 0;
        fs1 >> x;
        assert(x == 4.5);
        fs2 >> x;
        assert(x == 3.25);
    }
#ifndef TEST_HAS_NO_WIDE_CHARACTERS
    {
        std::wifstream fs1("test.dat");
        std::wifstream fs2("test2.dat");
        fs1.swap(fs2);
        double x = 0;
        fs1 >> x;
        assert(x == 4.5);
        fs2 >> x;
        assert(x == 3.25);
    }
#endif

  return 0;
}
