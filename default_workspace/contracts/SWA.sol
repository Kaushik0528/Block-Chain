// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity >=0.7.0 <0.9.0;
pragma abicoder v2;


import "@uniswap/v3-periphery/contracts/interfaces/ISwapRouter.sol";


interface IERC20 {
    function balanceOf(address account) external view returns (uint256);


    function transfer(address recipient, uint256 amount)
        external
        returns (bool);


    function approve(address spender, uint256 amount) external returns (bool);
}


contract SingleSwap {
    address public constant routerAddress =
        0x0227628f3F023bb0B980b67D528571c95c6DaC1c;
    ISwapRouter public immutable swapRouter = ISwapRouter(routerAddress);


    address public constant LINK = 0x779877A7B0D9E8603169DdbD7836e478b4624789;
    address public constant WETH = 0xE67ABDA0D43f7AC8f37876bBF00D1DFadbB93aaa;


    IERC20 public linkToken = IERC20(LINK);


    // For this example, we will set the pool fee to 0.3%.
    uint24 public constant poolFee = 3000;


    constructor() {}


    function swapExactInputSingle(uint256 amountIn)
        external
        returns (uint256 amountOut)
    {
        linkToken.approve(address(swapRouter), amountIn);


        ISwapRouter.ExactInputSingleParams memory params = ISwapRouter
            .ExactInputSingleParams({
                tokenIn: LINK,
                tokenOut: WETH,
                fee: poolFee,
                recipient: address(this),
                deadline: block.timestamp,
                amountIn: amountIn,
                amountOutMinimum: 0,
                sqrtPriceLimitX96: 0
            });


        amountOut = swapRouter.exactInputSingle(params);
    }


    function swapExactOutputSingle(uint256 amountOut, uint256 amountInMaximum)
        external
        returns (uint256 amountIn)
    {
        linkToken.approve(address(swapRouter), amountInMaximum);


        ISwapRouter.ExactOutputSingleParams memory params = ISwapRouter
            .ExactOutputSingleParams({
                tokenIn: LINK,
                tokenOut: WETH,
                fee: poolFee,
                recipient: address(this),
                deadline: block.timestamp,
                amountOut: amountOut,
                amountInMaximum: amountInMaximum,
                sqrtPriceLimitX96: 0
            });


        amountIn = swapRouter.exactOutputSingle(params);


        if (amountIn < amountInMaximum) {
            linkToken.approve(address(swapRouter), 0);
            linkToken.transfer(address(this), amountInMaximum - amountIn);
        }
    }
}