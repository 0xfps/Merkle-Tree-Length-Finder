// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

/**
* @title Merkle Tree Length Finder.
* @author Anthony (fps) https://github.com/fps8k.
* @dev When given the base number of elements, it returns the length of the merkle tree.
*/


contract MerkleTreeLengthFinder {
    /**
    * @dev Returns the expected Merkle Length of a Merkle Tree with base length `baseLeaf`.
    * [CONDITIONS]
    * `baseLeaf` is not 0.
    *
    * @param baseLeaf, given number of elements for the base.
    *
    * @return uint256 the expected Merkle Length.
    */
    function findMerkleLength(uint256 baseLeaf) public pure returns(uint256) {
        /// @dev Require baseLeaf is not 0.
        require(baseLeaf != 0, "Expected baseLeaf length GT 0.");
        /// @dev Run the Merkle Length finder function.
        return _findMerkleLength(baseLeaf);
    }

    /**
    * @dev Performs the calculations by splitting and Returns the expected Merkle Length of a Merkle Tree with base length `_baseLeaf`.
    *
    * @param _baseLeaf, given number of elements for the base.
    *
    * @return merkleLength :: The expected Merkle Length.
    */
    function _findMerkleLength(uint256 _baseLeaf) private pure returns(uint256 merkleLength) {
        /// @dev Set the passed `_baseLeaf` to a `baseLeaf` variable.
        uint256 baseLeaf = _baseLeaf;
        /// @dev Set the default starting length to be 1, this means the baseLeaf is included.
        uint256 length = 1;

        /// @dev Loop and split the baseLeaf in 2 until 1 is left.
        while (baseLeaf >= 1) {
            /// @dev If the baseLeaf is == 1, then no need for dividing and the length is returned.
            if (baseLeaf == 1) {
                /// @return length :: The length of the Merkle Tree.
                return length;
            }else {
                /// @dev Else:
                /// @dev If the `baseLeaf` is an even number, divide by 2.
                if (baseLeaf % 2 == 0) {
                    /// @dev Divide by 2.
                    baseLeaf = baseLeaf / 2;
                    /// @dev Increment length.
                    length ++;
                }else {
                    /// @dev Else if the `baseLeaf` is odd, then divide by 2 and add 1 [Solidity rounds down divisions with remainders].
                    baseLeaf = (baseLeaf / 2) + 1;
                    /// @dev Increment length.
                    length ++;
                }
            }
        }
    }
}