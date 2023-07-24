#!/bin/sh
# Precisa do przombies modificado pra salvar o pid no valor da variavel PIDFILE desse arquivo após o fork.
# O caminho desse przombies deve estar na variavel DAEMON.
# Finalmente, esse script deve ser copiado para /etc/init.d/ex23 para ser usado.

PIDFILE=/var/run/ex23.pid
DAEMON=/mnt/c/Users/danid/Desktop/so2-20231/trab3/przombies
NAME=ex23

. /lib/lsb/init-functions

case "$1" in
start)  log_daemon_msg "Starting $NAME"
        start_daemon -p $PIDFILE $DAEMON 60 &
        log_end_msg $?
        ;;
stop)   log_daemon_msg "Stopping $NAME"
        killproc -p $PIDFILE $DAEMON
        RETVAL=$?
        [ $RETVAL -eq 0 ] && [ -e "$PIDFILE" ] && rm -f $PIDFILE
        log_end_msg $RETVAL
        ;;
restart|reload|force-reload) log_daemon_msg "Restarting $NAME" 
        $0 stop
        $0 start
        ;;
status)
        status_of_proc -p $PIDFILE $DAEMON "$NAME" && exit 0 || exit $?
        ;;
*)      log_action_msg "Usage: /etc/init.d/ex23 {start|stop|status|restart|reload|force-reload}"
        exit 2
        ;;
esac
exit 0
