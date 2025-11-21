! THIS CODE IS WRITTEN IN FORTRAN 95 PROGRAMMING LANGUAGE
! Run this code easily online at https://www.onlinegdb.com/online_fortran_compiler

program guess_number 
    implicit none
    integer :: secret
    integer :: guess
    integer :: tries
    real :: r

    call random_seed()
    call random_number(r)

    secret = int(r * 10.0) + 1
    tries = 0

    do
        print *, "Guess a number between 1 - 10:"
        read(*,*) guess
        tries = tries + 1

        if (guess == secret) then
            print *, "You guessed the right number. Well done."
            print *, "Attempts:", tries

            exit
        else if (guess < secret) then
            print *, "Number is too low. Try again!"
        else
            print *, "Number is too high. Try again!"
        end if
    end do
end program guess_number