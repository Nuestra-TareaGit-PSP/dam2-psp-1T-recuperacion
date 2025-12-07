package es.fpsumma.dam2.torneos.web.advice;

import es.fpsumma.dam2.torneos.exception.TorneoNoEncontradoException;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ProblemDetail;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class TorneoExceptionHandler {

    @ExceptionHandler(TorneoNoEncontradoException.class)
    ProblemDetail handleTorneoNoEncontradoException(TorneoNoEncontradoException ex, HttpServletRequest request) {
        ProblemDetail pd = ProblemDetail.forStatusAndDetail(
                HttpStatus.NOT_FOUND,
                ex.getMessage()
        );
        pd.setTitle("Torneo no encontrado");
        return pd;
    }
}
