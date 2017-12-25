// Copyright 2015 The go-ethereum Authors
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

package params

// MainnetBootnodes are the enode URLs of the P2P bootstrap nodes running on
// the main Ethereum network.
var MainnetBootnodes = []string{
	"enode://b8e3b8341f75eb108c5e0195fd386782e3e6c79dd8fb4e437289b57aac0cfa0d3d29aa2067fecc7661ba43b8ed8461e3d21d90075791f349117bc8a1e6645839@94.177.12.112:41207",
	"enode://6aa1e13b9dd218a316660fb60dc9bbb5668385a6a0881b178d7832b42de8d3c499bef7cf8fe1648ec120159fbf09e55336c85a5a5f6113026893f7ba831f7e67@192.161.167.147:41207",
}

// TestnetBootnodes are the enode URLs of the P2P bootstrap nodes running on the
// Ropsten test network.
var TestnetBootnodes = []string{
 	"enode://c59226f3d5c29b2112f6566234fcc4c808d35319f730d713f7ac39f377508e3682d4936dd10cd2cfedb1442f790001931916a27d178c496b9cf2a48b77d74a8b@192.161.167.147:41207"	
}

// RinkebyBootnodes are the enode URLs of the P2P bootstrap nodes running on the
// Rinkeby test network.
var RinkebyBootnodes = []string{
}

// RinkebyV5Bootnodes are the enode URLs of the P2P bootstrap nodes running on the
// Rinkeby test network for the experimental RLPx v5 topic-discovery network.
var RinkebyV5Bootnodes = []string{
}

// DiscoveryV5Bootnodes are the enode URLs of the P2P bootstrap nodes for the
// experimental RLPx v5 topic-discovery network.
var DiscoveryV5Bootnodes = []string{
}
