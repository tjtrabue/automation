#!/bin/bash

if [[ `"xcode-select -p"` == 2 ]]; then
	xcode-select --install
fi