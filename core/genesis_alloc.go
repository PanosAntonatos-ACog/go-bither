// Copyright 2017 The go-ethereum Authors
// This file is part of the go-ethereum library.
//
// The go-ethereum library is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// The go-ethereum library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with the go-ethereum library. If not, see <http://www.gnu.org/licenses/>.

package core

// Constants containing the genesis allocation of built-in genesis blocks.
// Their content is an RLP-encoded list of (address, balance) tuples.
// Use mkalloc.go to create/update them.
const mainnetAllocData="\xf8c\xe0\x94&x\x88\xf1\xc5-Q\xe70\xc0\u046bz\r;\x01\ucc3d8\x8ai\xe1\r\xe7fv\u0400\x00\x00\xe0\x94\xd0\xe8\xf3\x8f\x88/\u699d\x9e\x96@yb\xbe\xb7X$\xc9\u044ai\xe1\r\xe7fv\u0400\x00\x00\xe0\x94\xf8\x93:\a\xfa\xf1`\u016a\x0e\u0567\xf8\xa5;j\x19\xe8\xab\xef\x8a\xd3\xc2\x1b\xce\xcc\xed\xa1\x00\x00\x00"
const testnetAllocData = "\xe2\u151c\x98\x94\x9e3\xe9a9\xe1\xb57\xd8M\xf4\x01\xe2JJJ\u03cb\x04\"\u028b\n\x00\xa4%\x00\x00\x00"
const rinkebyAllocData = "\xc0"
const devAllocData = "\xc0"

