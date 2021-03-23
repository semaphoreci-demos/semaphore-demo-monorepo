#!/bin/bash

(cd services/billing && go build -o /tmp/billing-server && chmod +x /tmp/billing-server && /tmp/billing-server &)
(cd services/users && bundle exec ruby app.rb &)
(cd services/ui && mix run --ho-halt &)
