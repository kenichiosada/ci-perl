#!/bin/sh

carton exec perl local/bin/ukigumo-server --max-workers=3 --config=config.pl
